# frozen_string_literal: true

# observable object aka subject
module Observable
  def attach_observer(observer)
    @observers ||= []
    @observers << observer unless @observers.include?(observer)
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end
end

# observable object aka subject
class Logger
  include Observable

  def record(msg, level = :info, status = 200)
    log_entry = { level: level, status: status, msg: msg }
    puts "sent #{log_entry} to Splunk"
    notify(log_entry)
  end

  def notify(log_entry)
    @observers.each do |observer|
      puts "sent #{log_entry} to #{observer.email}"
    end
  end
end

api_log = Logger.new
Observer = Struct.new(:log_level, :email)
sre = Observer.new(:info, 'sre@example.com')
dev = Observer.new(:error, 'dev@example.com')
api_log.attach_observer(sre)
api_log.attach_observer(dev)

def call_api(api_log, _request)
  # form request
  begin
    # make api call
    api_log.record('got all the cat gifs', :info, 200)
  rescue => e
    api_log.record(e, :error, 500)
  end
end

call_api(api_log, 'get cat gifs')

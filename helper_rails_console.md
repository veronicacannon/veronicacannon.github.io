# call helper from rails console

Remember to prefix the method with `helper.` to run in rails console.

Given a helper method like this:

```ruby
module PostHelper
  def markdown(text)
    options = [
      no_intra_emphasis: true, 
      fenced_code_blocks: true,
      gh_blockcode: true,   
      disable_indented_code_blocks: true,
      prettify: true
    ]
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, *options)
    markdown.render(text).html_safe
  end
end
```

To test in `rails console` try this:

```
$ rails console
Loading development environment (Rails 6.0.1)
[1] pry(main)> helper.markdown("Hello, world!")
=> "<p>Hello, world!</p>\n"
[2] pry(main)>
```


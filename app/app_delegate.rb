class AppDelegate < PM::Delegate

  def on_load(app, options)
    open SearchScreen.new(nav_bar: true)
  end

end

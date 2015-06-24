class SiteGenerator
  attr_reader :rendered_path

  def initialize(rendered_path)
    @rendered_path = rendered_path
  end

  def reset_dir(path)
    FileUtils.rm_rf(path)
    FileUtils.mkdir_p(path)
    # we need to delete the current _site directory
    # we need to make a new one
  end

  def build_index
    reset_dir(self.rendered_path)
    html = File.read("app/views/index.html.erb")
    template = ERB.new(html)
    File.write("#{self.rendered_path}/index.html", template.result)
  end

  def build_artists_index
    html = File.read("app/views/artists/index.html.erb")
    template = ERB.new(html)
    File.write("#{self.rendered_path}/artists/index.html", template.result)
  end
end

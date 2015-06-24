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
    reset_dir("#{self.rendered_path}/artists/")
    html = File.read("app/views/artists/index.html.erb")
    template = ERB.new(html)
    File.write("#{self.rendered_path}/artists/index.html", template.result)
  end

  def build_songs_index
    reset_dir("#{self.rendered_path}/songs/")
    html = File.read("app/views/songs/index.html.erb")
    template = ERB.new(html)
    File.write("#{self.rendered_path}/songs/index.html", template.result)
  end

  def build_genres_index
    reset_dir("#{self.rendered_path}/genres/")
    html = File.read("app/views/genres/index.html.erb")
    template = ERB.new(html)
    File.write("#{self.rendered_path}/genres/index.html", template.result)
  end

  def build_artist_page
    html = File.read("app/views/artists/show.html.erb")
    template = ERB.new(html)
    Artist.all.each {|artist|
      result = template.result(binding)
      File.write("#{self.rendered_path}/artists/#{artist.to_slug}.html", result)
    }
  end

  # def generate_pages!
  #   FileUtils.rm_rf('_site/movies')
  #   FileUtils.mkdir_p('_site/movies')
  #   html = File.read("lib/templates/movie.html.erb")
  #   template = ERB.new(html)
  #   @movies = Movie.all
  #   @movies.each {|movie|
  #     result = template.result(binding)
  #     File.write("_site/movies/#{movie.url}", result)
  #   }
  # end
end

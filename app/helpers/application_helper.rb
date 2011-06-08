module ApplicationHelper

  def keywords
    keywords = [
      '',
      '',
      '',
      '',
      ''
    ].join(', ')
  end

  def title
    base = "Dice Envy"
    unless @title.blank?
      base += ' - ' + @title
    end
    base
  end

  def include_metadata group
    render partial: 'layouts/meta', locals: {group: group}
  end

  def include_fonts group
    fonts = case group
      when :all
        ["Philosopher", "Merriweather", "Nobile:regular,bold"] +
        ["Droid+Sans:regular,bold", "Droid+Serif:regular,italic,bold"]
      when :default
        ["Droid+Sans:regular,bold", "Droid+Serif:regular,italic,bold"]
    end
    stylesheet_link_tag "http://fonts.googleapis.com/css?family=" + fonts.join('|')
  end

  def include_header
    render partial: 'layouts/header'
  end

  def include_footer
    render partial: 'layouts/footer'
  end

  def requires_header?
    true unless @header == false
  end

  def requires_footer?
    true unless @footer == false
  end
end

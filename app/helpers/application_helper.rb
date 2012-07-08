module ApplicationHelper

  def normalizar_texto(texto, largo)
    truncate(strip_tags(sanitize(BBCoder.new(texto).to_html.html_safe)), length: largo).gsub("&nbsp;"," ")
  end

  def sanitizar_bbcode(texto)
    (BBCoder.new(texto).to_html).html_safe if texto.present?
  end

end

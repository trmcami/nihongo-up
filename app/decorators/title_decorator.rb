class TitleDecorator < Draper::Decorator
  delegate_all

  def summary
    object.summary.present? ? h.sanitize(object.summary) : 'No plot summary available.'
  end

  def image
    object.image.present? ? object.image : 'http://www.formica.com/us/~/media/global-images/ui/noimageavailable.png'
  end

  def name
    h.truncate(object.name, length: 45)
  end
end

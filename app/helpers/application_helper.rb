module ApplicationHelper

  def title
  	if @page_title then
      ' - ' + @page_title
    end
  end

end

module ApplicationHelper

  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+1-#{sets_of_numbers.join('-')}"
    link_to '<i class="fa fa-phone-square"></i>' + text, "tel:#{number}"
  end

end

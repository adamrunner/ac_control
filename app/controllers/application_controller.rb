class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :flash_to_headers
  private

  def flash_to_headers
    return unless request.xhr?
    msg = flash_message
    #replace german umlaute encoded in utf-8 to html escaped ones
    response.headers['X-Message'] = msg
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end

  def flash_message
    [:error, :warning, :info, :notice].each do |type|
      return flash[type] unless flash[type].blank?
    end
    return ''
  end

  def flash_type
    flash_map = {
      :error   => 'alert-danger',
      :warning => 'alert-warning',
      :info    => 'alert-info',
      :notice  => 'alert-success'
    }
    #:keep will instruct the js to not update or remove the shown message.
    #just write flash[:keep] = true (or any other value) in your controller code
    [:error, :warning, :notice, :info, :keep].each do |type|
      if flash[type]
        return flash_map[type]
      else
        return :empty
      end
    end
  end
end

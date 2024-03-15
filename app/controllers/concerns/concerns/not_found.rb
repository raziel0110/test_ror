module Concerns
  module NotFound
    extend ActiveSupport::Concern

    private

    def handle_not_found(klass_or_message = Playlist, custom_message = false)
      message = if klass_or_message.is_a?(String)
        klass_or_message
      else
        klass_or_message.name.demodulize.titleize
      end

      message += " not found" unless custom_message

      render json: message.to_json, status: 422
    end
  end
end

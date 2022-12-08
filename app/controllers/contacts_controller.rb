class ContactsController < ApplicationController
    def new 

    end

    def create
        @feedback = Contact.new contact_params  
          if @feedback.valid?
            @feedback.save
          else 
            @errors = @feedback.errors.full_messages
            @rus_errors= parse_errors @errors
            render action: 'new'
        end
    end

    private

    def  contact_params
        params.permit(:name,:email, :message)
    end

    def parse_errors arr
        rus_errors ={
            "Name can't be blank" => 'Введите имя',
            "Email can't be blank" => 'Введите адрес эл. почты',
            "Message can't be blank" => 'Введите сообщение',
        }
        error_message = []
        arr.map do |error|
            error_message<< rus_errors[error]
        end
        return error_message
    end
end

require 'sinatra'
require 'sendgrid-ruby'
# require 'sinatra/flash'
# require 'valid_email'
# require 'valid_email/validate_email'
# set :port, 9494
# enable :sessions

get '/' do 
  erb :home
end

post '/email' do 
  # if ValidateEmail.valid?(params[:mail])
    client = SendGrid::Client.new(api_key: 'SENDGRID_PASSWORD')
    email = SendGrid::Mail.new do |m|
      m.to      = 'liana.schapiro@gmail.com'
      m.from    = params[:mail]
      m.subject = 'Email Sent From Stride Movers'
      m.text    = "Name: #{params[:name]}\r\n\r\nPhone: #{params[:number]}\r\n\r\nBody: #{params[:comment]}"
    end
  if client.send(email)
    flash[:notice]="You've messaged me, I'll get back to you asap!"
    redirect '/'
  else
    flash[:notice]="Please use a properly formatted email address!"
    redirect '/#quote'
  end
end

get '/resume' do 
  erb :resume
end
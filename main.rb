require 'sinatra'
require 'sendgrid-ruby'
require 'sinatra/flash'
# require 'valid_email'
# require 'valid_email/validate_email'
# set :port, 9494
enable :sessions

get '/' do 
  erb :home
end

get '/customer_agreement' do
  erb :agreement
end

post '/email' do 
    client = SendGrid::Client.new(api_key: ENV['SENDGRID_API_KEY'])
    email = SendGrid::Mail.new do |m|
      m.to      = 'stridemovers@gmail.com'
      m.from    = params[:mail]
      m.subject = 'Email Sent From Stride Movers Website'
      m.html    = "<style='font-size:16px'>
      				<b> Name: </b> #{params[:name]}<br><br>
      				<b> Email: </b> #{params[:mail]}<br><br>
      				<b> Phone: </b> #{params[:phone]}<br><br>
      				<b> Secondary Phone: </b> #{params[:phone2]}<br><br>
      				<b> How did you hear about us: </b> #{params[:refer]}<br><br>
      				<b> Date 1: </b> #{params[:date1]}<br><br>
              <b> Time 1: </b> #{params[:time1]}<br><br>
      				<b> Date 2: </b> #{params[:date2]}<br><br>
              <b> Time 2: </b> #{params[:time2]}<br><br>
      				<b> Date 3: </b> #{params[:date3]}<br><br>
              <b> Time 3: </b> #{params[:time3]}<br><br>
      				<b> Date details: </b> #{params[:datedetails]}<br><br>
      				<b> Starting address: </b> #{params[:starting]}<br><br>
      				<b> Stairs @ start: </b> #{params[:stairs_start]}<br><br>
      				<b> Details @ start: </b> #{params[:stairdetails_start]}<br><br>
      				<b> COI needed? </b> #{params[:certificate]}<br><br>
      				<b> Ending address: </b> #{params[:ending]}<br><br>
      				<b> Stairs @ end: </b> #{params[:stairs_end]}<br><br>
					    <b> Details @ end: </b> #{params[:stairdetails_end]}<br><br>  				
      				<b> Deadlines: </b> #{params[:deadlines]}<br><br>
      				<b> Furniture list: </b> #{params[:furniture]}<br><br>
      				<b> Valuables: </b> #{params[:valuable]}<br><br>
      				<b> Assembly? </b> #{params[:assemble]}<br><br>
      				<b> Small boxes: </b> #{params[:smallbox]}<br><br>
      				<b> Medium boxes: </b> #{params[:mediumbox]}<br><br>
      				<b> Large boxes: </b> #{params[:largebox]}<br><br>
      				<b> Wardrobe boxes: </b> #{params[:wardrobebox]}<br><br>
              <b> Manpower needs: </b> #{params[:vehicle_type]}<br><br>
      				<b> Other items: </b> #{params[:other_items]}<br><br>
      				<b> Other info: </b> #{params[:other]}<br><br>
              <b> Agree to customer agreement?: </b> #{params[:customer_agreement]}
      				</style>"
    end
  if client.send(email)
      flash[:notice]="Thanks for your information, we will get in touch within 24 hours!"
    redirect '/'
  else
    # flash[:notice]="Please agree to the customer agreement"
    redirect '/#quote'
  end
end

post '/refer' do 
    client = SendGrid::Client.new(api_key: ENV['SENDGRID_API_KEY'])
    email = SendGrid::Mail.new do |m|
      m.to      = 'stridemovers@gmail.com'
      m.from    = params[:mail]
      m.subject = 'Referral From Stride Movers Website'
      m.html    = "<style='font-size:16px'>
              <b> Name: </b> #{params[:name]}<br><br>
              <b> Email: </b> #{params[:mail]}<br><br>
              <b> Phone: </b> #{params[:phone]}<br><br>
              <b> Referral Name: </b> #{params[:refer_name]}<br><br>
              <b> Referral Email: </b> #{params[:refer_mail]}<br><br>
              <b> Referral Phone: </b> #{params[:refer_phone]}<br><br>
              <b> Potential Move Date: </b> #{params[:move_date]}<br><br>
              <b> Details: </b> #{params[:details]}
              </style>"
    end
  if client.send(email)
      # flash[:notice]="Thanks for your information, we will get in touch within 24 hours!"
    redirect '/'
  else
    # flash[:notice]="Please agree to the customer agreement"
    redirect '/#partner'
  end
end

get '/resume' do 
  erb :resume
end
class CalendarsController < ApplicationController
  def show
    date = Date.parse(params[:date])
    render partial: 'calendars/calendar', locals: { anchor_date: date }
    puts "Anchor date: #{date}"

  end
end

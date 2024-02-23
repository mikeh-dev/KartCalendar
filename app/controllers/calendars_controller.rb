class CalendarsController < ApplicationController
  def show
    date = Date.parse(params[:date] || Date.today)
    render partial: 'calendars/calendar', locals: { anchor_date: date }

  end
end

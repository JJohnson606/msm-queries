class DirectorsController < ApplicationController
  def index
    render({ :template => "directors_templates/list" })
  end
  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "directors_templates/details" })
  end
  def eldest
    @eldest_director = Director.where.not(:dob => nil ).order(dob: :asc).first
    render({ :template => "directors_templates/eldest" })
  end
  def junior
    @youngest_director = Director.where.not(:dob => nil ).order(dob: :desc).first
    render({ :template => "directors_templates/youngest" })
  end
end
Director.where.not({ :dob => nil })

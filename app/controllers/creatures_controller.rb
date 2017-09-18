class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def create
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creatures_path(creature)
    end
  end

  def new
    @creature = Creature.new
  end

  def show
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def update
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    creature = Creature.find_by_id(creature_id)

    # update the creature
    creature.update_attributes(creature_params)

    # redirect to show page for the updated creature
    redirect_to creature_path(creature)
  end

  def destroy
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to a variable
    creature = Creature.find_by_id(creature_id)

    # destroy the creature
    creature.destroy

    # redirect to creatures index
    redirect_to creatures_path
  end

  private
  def creature_params
    params.require(:creature).permit(:name, :description)
  end
end

class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
  end

  def show
  end

  def new
  end

  def create
    @widget = Widget.new(widget_params)
    if @widget.save
      redirect_to @widget, notice: 'Widget was created succesfully'
    else
      render :new
    end
  end

  def delete
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def widget_params
    params.require(:widget).permit(:name)
  end
end

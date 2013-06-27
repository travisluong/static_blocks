require_dependency "static_blocks/application_controller"

module StaticBlocks
  class StaticBlocksController < ApplicationController

    def export
      t = Time.now.strftime('%Y%m%d%H%M%S')
      filename = "static-blocks-#{t}.csv"
      respond_to do |format|
        format.csv do
          send_data StaticBlock.to_csv, :filename => filename
        end
      end
    end

    def export_translations
      t = Time.now.strftime('%Y%m%d%H%M%S')
      filename = "static-blocks-translations-#{t}.csv"
      respond_to do |format|
        format.csv do
          send_data StaticBlock.translations_to_csv, :filename => filename
        end
      end
    end

    def import
      if params[:file].nil?
        redirect_to root_url
        flash[:error] = "You did not attach a file."
      elsif params[:file].original_filename.include? 'translations'
        redirect_to root_url
        flash[:error] = "Wrong file. You uploaded the translations."
      else
        StaticBlock.import(params[:file])
        redirect_to root_url, notice: "Static Blocks imported"
      end
    end

    def import_translations
      if params[:file].nil?
        redirect_to root_url
        flash[:error] = "You did not attach a file."
      elsif params[:file].original_filename.include? 'translations'
        StaticBlock.import_translations(params[:file])
        redirect_to root_url, notice: "Static Block translations imported"
      else
        redirect_to root_url
        flash[:error] = "Wrong file. You uploaded the default static blocks."
      end
    end

    # GET /static_blocks
    # GET /static_blocks.json
    def index
      @search = StaticBlock.search(params[:q])
      @static_blocks = @search.result.per_page_kaminari(params[:page]).per(10)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @static_blocks }
      end
    end

    # GET /static_blocks/1
    # GET /static_blocks/1.json
    def show
      @static_block = StaticBlock.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @static_block }
      end
    end

    # GET /static_blocks/new
    # GET /static_blocks/new.json
    def new
      @static_block = StaticBlock.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @static_block }
      end
    end

    # GET /static_blocks/1/edit
    def edit
      @static_block = StaticBlock.find(params[:id])
    end

    # POST /static_blocks
    # POST /static_blocks.json
    def create
      @static_block = StaticBlock.new(params[:static_block])

      respond_to do |format|
        if @static_block.save
          format.html { redirect_to @static_block, notice: 'Static block was successfully created.' }
          format.json { render json: @static_block, status: :created, location: @static_block }
        else
          format.html { render action: "new" }
          format.json { render json: @static_block.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /static_blocks/1
    # PUT /static_blocks/1.json
    def update
      @static_block = StaticBlock.find(params[:id])

      respond_to do |format|
        if @static_block.update_attributes(params[:static_block])
          format.html { redirect_to @static_block, notice: 'Static block was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @static_block.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /static_blocks/1
    # DELETE /static_blocks/1.json
    def destroy
      @static_block = StaticBlock.find(params[:id])
      @static_block.destroy

      respond_to do |format|
        format.html { redirect_to static_blocks_url }
        format.json { head :no_content }
      end
    end
  end
end

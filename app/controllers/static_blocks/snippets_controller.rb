require_dependency "static_blocks/application_controller"

module StaticBlocks
  class SnippetsController < ApplicationController

    def export
      unless Snippet.any?
        flash[:error] = "There are no snippets"
        redirect_to root_url
        return
      end

      t = Time.now.strftime('%Y%m%d%H%M%S')
      filename = "static-blocks-snippets-#{t}.csv"

      respond_to do |format|
        format.csv do
          send_data Snippet.to_csv, :filename => filename
        end
      end
    end

    def export_translations
      unless Snippet.any?
        flash[:error] = "There are no translations"
        redirect_to root_url
        return
      end

      t = Time.now.strftime('%Y%m%d%H%M%S')
      filename = "static-blocks-translations-#{t}.csv"

      respond_to do |format|
        format.csv do
          send_data Snippet.translations_to_csv, :filename => filename
        end
      end
    end

    def import
      if params[:file].nil?
        redirect_to root_url
        flash[:error] = "You did not attach a file."
      elsif params[:file].original_filename.include? 'static-blocks-snippets'
        Snippet.import(params[:file])
        redirect_to root_url, notice: "Snippets imported"
      else
        redirect_to root_url
        flash[:error] = "Error. Please upload a valid static-blocks-snippets csv."
      end
    end

    def import_translations
      if params[:file].nil?
        redirect_to root_url
        flash[:error] = "You did not attach a file."
      elsif params[:file].original_filename.include? 'static-blocks-translations'
        Snippet.import_translations(params[:file])
        redirect_to root_url, notice: "Snippet translations imported"
      else
        redirect_to root_url
        flash[:error] = "Error. Please upload a valid static-blocks-translations csv."
      end
    end

    # GET /static_blocks
    # GET /static_blocks.json
    def index
      @search = Snippet.order('title asc').search(params[:q])
      @snippets = @search.result.per_page_kaminari(params[:page]).per(10)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @snippets }
      end
    end

    # GET /snippets/1
    # GET /snippets/1.json
    def show
      @snippet = Snippet.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @snippet }
      end
    end

    # GET /snippets/new
    # GET /snippets/new.json
    def new
      @snippet = Snippet.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @snippet }
      end
    end

    # GET /snippets/1/edit
    def edit
      @snippet = Snippet.find(params[:id])
    end

    # POST /snippets
    # POST /snippets.json
    def create
      @snippet = Snippet.new(params[:snippet])

      respond_to do |format|
        if @snippet.save
          format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
          format.json { render json: @snippet, status: :created, location: @snippet }
        else
          format.html { render action: "new" }
          format.json { render json: @snippet.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /snippets/1
    # PUT /snippets/1.json
    def update
      @snippet = Snippet.find(params[:id])

      respond_to do |format|
        if @snippet.update_attributes(params[:snippet])
          format.html { redirect_to @snippet, notice: 'Static block was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @snippet.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /snippets/1
    # DELETE /snippets/1.json
    def destroy
      @snippet = Snippet.find(params[:id])
      @snippet.destroy

      respond_to do |format|
        format.html { redirect_to snippets_url }
        format.json { head :no_content }
      end
    end
  end
end

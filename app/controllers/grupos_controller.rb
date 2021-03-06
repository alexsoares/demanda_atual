class GruposController < ApplicationController
require_role ["seduc","admin"]
  # GET /grupos
  # GET /grupos.xml
  def index
    @search = Grupo.search(params[:search])
    @grupos = @search.paginate(:all,:page => params[:page], :per_page => 10)
      
   # @grupos = Grupo.paginate(:page => params[:page], :per_page => 10,:conditions => ["nome like ?", "%" + params[:search].to_s + "%"])
    #@grupos = Grupo.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @grupos }
    end
  end

  # GET /grupos/1
  # GET /grupos/1.xml
  def show
    @grupo = Grupo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grupo }
    end
  end

  # GET /grupos/new
  # GET /grupos/new.xml
  def new
    @grupo = Grupo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grupo }
    end
  end

  # GET /grupos/1/edit
  def edit
    @grupo = Grupo.find(params[:id])
  end

  # POST /grupos
  # POST /grupos.xml
  def create
    @grupo = Grupo.new(params[:grupo])

    respond_to do |format|
      if @grupo.save
        flash[:notice] = 'Grupo cadastrado com sucesso.'
        format.html { redirect_to(@grupo) }
        format.xml  { render :xml => @grupo, :status => :created, :location => @grupo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grupo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /grupos/1
  # PUT /grupos/1.xml
  def update
    @grupo = Grupo.find(params[:id])

    respond_to do |format|
      if @grupo.update_attributes(params[:grupo])
        flash[:notice] = 'Grupo atualizado com sucesso.'
        format.html { redirect_to(@grupo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grupo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.xml
  def destroy
    @grupo = Grupo.find(params[:id])
    @grupo.destroy

    respond_to do |format|
      format.html { redirect_to(grupos_url) }
      format.xml  { head :ok }
    end
  end
end

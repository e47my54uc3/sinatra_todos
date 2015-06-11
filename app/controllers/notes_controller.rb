
#index
get '/notes' do
 @notes = Note.all
 erb :"notes/index"
end

#new

get '/notes/new' do
  @note = Note.new
  erb :"notes/new"
end

#create

post '/notes' do
  @note = Note.new(
    front: params[:front],
    back_info: params[:back_info],
    )
  if @note.save
    redirect "/notes/#{@note.id}"
  else
    status 400
    erb :"notes/new"
  end
end
#show

get '/notes/:id' do
  @note = Note.where(id: params[:id]).first
  if @note
    erb :'notes/show'
  else
    status 404
    "Note not found!"
  end
end

#edit

get '/notes/:id/edit' do
  @note = Note.where(id: params[:id]).first
  if @note
    erb :"notes/edit"
  else
    status 404
    "Note not found!"
  end
end


#update

put '/notes/:id' do
  @note = Note.where(id: params[:id]).first
  @note.front = params[:front]
  @note.back_info = params[:back_info]

  if @note.save
    redirect "/notes"
  else
    status 401
    redirect "notes/#{:id}/edit"
  end
end
  


#delete
delete '/notes/:id' do
  @note = Note.where(id: params[:id]).first
  if @note
    @note.destroy
    redirect '/notes'
  else
    status 404
    "Note not found"
  end
end











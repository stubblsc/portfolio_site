json.array!(@arts) do |art|
  json.extract! art, :id, :title, :subsection_id, :medium, :description
  json.url art_url(art, format: :json)
end

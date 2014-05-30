json.array!(@sections) do |section|
  json.extract! section, :id, :title, :type_id, :has_subsection
  json.url section_url(section, format: :json)
end

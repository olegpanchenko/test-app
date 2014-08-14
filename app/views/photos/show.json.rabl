attributes :id
node(:name) { |photo| photo.file_file_name}
node(:size) { |photo| photo.file_file_size}
node(:url) { |photo| photo.file.url}
node(:thumbnailUrl) { |photo| photo.file.url(:thumb)}
node(:deleteUrl) { |photo| photo_path(photo.id)}
node(:error) { |photo| photo.errors.full_messages.join(',') unless photo.errors.empty? }
user = User.create!(
  name: 'Вася Пупкин',
  email: 't@t.tе',
  password: 'password',
  password_confirmation: 'password')

(1..9).each do |i|
  user.posts.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph)
end

(0..2).each do |locale|
  (0..2).each do |id|
    Movie.create!(
      title: "Movie-#{locale}-#{id}",
      vimeo_id: locale*3+id,
      locale: LOCALES[locale],
      main: (id == 0))
  end
end

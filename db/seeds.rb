# frozen_string_literal: true

user = User.create!(
  name: 'Вася Пупкин',
  email: 'admin@skymemories.ru',
  password: 'password',
  password_confirmation: 'password',
)

10.times do
  user.posts.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
  )
end

(0..2).each do |locale|
  (0..2).each do |id|
    Movie.create!(
      title: "Movie-#{locale}-#{id}",
      vimeo_id: locale * 3 + id,
      locale: LOCALES[locale],
      thumbnail: 'http://b.vimeocdn.com/ts/450/734/450734986_100.jpg',
      main: (id == 0),
    )
  end
end

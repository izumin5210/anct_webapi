namespace :anct do
  namespace :master do
    task import: :environment do

      Department.destroy_all
      Course.destroy_all

      puts 'create Department...'
      {m: '機械工学科', e: '電気情報工学科', c: '都市システム工学科', a: '建築学科', adv: '専攻科'}.each do |abbr, name|
        Department.create name: name, abbr: abbr.to_s
      end

      puts 'create Course...'
      {d: '電気電子工学コース', j: '情報工学コース', me: '機械・電子システム工学専攻', ac: '建築・都市システム工学専攻'}.each do |abbr, name|
        Course.create name: name, abbr: abbr.to_s
      end
    end
  end
end

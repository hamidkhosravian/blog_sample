namespace :docs do
  desc "Generate API documents"
  task generate: :environment do
    OpenApi.write_docs
    system("spring stop")
  end
end

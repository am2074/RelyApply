json.companies do 
	json.array!(@companies) do |company|
		json.name company.name
		json.url company_path(company)
	end
end
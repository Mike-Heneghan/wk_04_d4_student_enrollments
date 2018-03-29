require_relative('sql_runner')

class House

attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
  end

  def save
    sql = "
    INSERT INTO houses (name) VALUES ($1)
    RETURNING id
    "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

end

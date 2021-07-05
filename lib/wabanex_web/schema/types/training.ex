defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  @desc "Logic training representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  @desc "Create new training"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "Training user_id"
    field :start_date, non_null(:string), description: "Training Start Date"
    field :end_date, non_null(:string), description: "Training End Date"
    field :exercises, list_of(:create_exercise_input), description: "Training List of Exercises"
  end
end

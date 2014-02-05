class tetris

  construct: (@width, @height) ->
    @array = this.array_factory()
    @mid = Math.floor(@height/2)
    @wedge = [@mid, @mid + @width + @mid + @width - 1, @mid + @width + 1]
    @square = [@mid, @mid + 1, @mid+ @width, @mid + @width + 2]
    @stick = [@mid, @mid+@width, @mid+@width+1, @mid+@width+2]
    @spear = [@mid, @mid+@width, @mid+2*@width, @mid+3*@width]
    @twist = [@mid, @mid+@width, @mid+@width+1, @mid+@width+1+@width]
    @tetris_block = [@wedge, @square, @stick, @twist,@spear]
    @current_rotation_code = 0
    @current_block_type = this.block_type_factory()
    @current_block = this.current_block_factory()
    @dead_block = []
    @current_score=0
    @next_block_type = this.block_type_factory()
    @next_block = this.next_block_factory()

  reset: ->
    @array = this.array_factory
    @current_rotation_code = 0
    @current_block_type = this.block_type_factory()
    @current_block = this.current_block_factory()
    @next_block_type = this.block_type_factory()
    @next_block = this.next_block_factory()
    @dead_block = []

  get_array: ->
    return @array

  get_dead_block: ->
    # return @dead_block # to be used when finalized. Now I will use the following for quick debug
    @dead_block = (i for item,i in @array when item == 2)
    return @dead_block

  array_factory: ->
    @array = (0 for item in[0...@width*@height])

  block_type_factory: ->
    Math.floor(Math.random() * @tetris_block.length)

  current_block_factory: ->
    this.tetris_block[this.current_block_type]

  next_block_factory: ->
    this.tetris_block[this.next_block_type]

  to_s: ->







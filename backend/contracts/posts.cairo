%lang starknet

@storage_var
func post_count() -> (count: felt):
end

@storage_var
func post_by_id(id: felt) -> (content: felt):
end

@external
func create_post(content: felt):
    alloc_locals
    let (current_count) = post_count.read()
    post_by_id.write(current_count, content)
    post_count.write(current_count + 1)
end

@view
func get_post_by_id(id: felt) -> (content: felt):
    let (content) = post_by_id.read(id)
    return (content)
end

@view
func get_post_count() -> (count: felt):
    let (count) = post_count.read()
    return (count)
end

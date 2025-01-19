%lang starknet

from contracts.posts import create_post, get_post_by_id, get_post_count

@external
func test_post_creation():
    alloc_locals
    create_post(content=12345)
    let (post_count) = get_post_count()
    assert post_count == 1

    let (content) = get_post_by_id(id=0)
    assert content == 12345
    return ()
end

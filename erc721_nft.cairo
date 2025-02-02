%lang starknet

@contract
mod ERC721 {
    struct NFT {
        owners: map<u256, felt252>,
    }

    #[external]
    fn mint(ref self: NFT, token_id: u256, owner: felt252) {
        self.owners.insert(token_id, owner);
    }

    #[view]
    fn owner_of(self: NFT, token_id: u256) -> felt252 {
        return self.owners.get_or(token_id, 0);
    }
}

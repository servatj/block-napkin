// Ethereum Name Registrar as it should be!
//
// Written by Alexandre Naverniouk
// twitter @AlexNa


contract Napker {

    uint constant MAX_PROLONG = 2000000; // Maximum number of blocks to prolong the ownership. About one year.
    
    uint public n_napkers = 0;      // total number of registered domains
    uint public root_napkers = 0;    // name of the first domain in the linked list
    address contract_napker = 0; // owner
    
    struct Id {                     // Id record. Double linked list. Allows to delete ID
        uint value;
        uint next_id;
        uint prev_id;
    }
    
    struct Napker {                 // Domain record. Linked list. 
        address contract_napker;              
        uint asset;    
        uint root_id;           
        mapping (uint => Id) ids;   // Map of the ID's
    }
    
    mapping (uint => Napker) napkers; // Map of the domains
    
    function Napkin()
    {
        contract_napker = msg.sender;
    }

    // function addAsset (uint id) public {
    //     n_napkers[id] = id.value;
    // }
    
    function getId( uint napker, uint id ) constant returns (uint v, uint next_id, uint prev_id )
    {
        Id i = napkers[napker].ids[id]; 
    
        v = i.value;
        next_id = i.next_id;
        prev_id = i.prev_id;
    }
    
    function getNapker( uint napker ) constant returns 
        (address contract_napker, uint asset, uint root_id )
    {
        Napker d = napkers[ napker ];
        
        contract_napker = d.contract_napker;
        asset = d.asset;
        root_id = d.root_id;    
    }
    
}

globalvar stack, discardStack, cards, stackSize, discardSize, players, curPlayer, stackSelected, discardSelected;

randomise();


// Get player count
playerCount = 0;
curPlayer = 0;

do {
	playerCount = get_integer("How many players? [2 -> 4]", "");
} until (playerCount > 1 && playerCount < 5);


// Setup the main stack array
switch (playerCount) {
	case 4: stackSize = 60; break;
	case 3: stackSize = 50; break;
	case 2: stackSize = 40; break;
}

stack = array_create(stackSize);

for (i = 0; i < stackSize; i++)
	stack[i] = i + 1;
	
	
// Shuffle the stack
for (i = 0; i < 10000; i++) {
	// Find some index
	x = random_range(0, stackSize);
	y = random_range(0, stackSize);
	
	// Swap the numbers at the two indicies
	if (x != y) {
		temp = stack[x];
		stack[x] = stack[y];
		stack[y] = temp;
	}
	else i--;
}


// Setup the players
players = array_create(playerCount);
var cardCount = 10;

for (i = 0; i < playerCount; i++) {
	players[i] = instance_create_layer(0, 0, 0, o_player);
	
	players[i].cards = array_create(cardCount);
	
	// Fill the stack
	for (j = 0; j < cardCount; j++) {
		players[i].cards[j] = stack[stackSize - 1];
		stackSize--;
	}
	
	
	// Get their name
	do {
		players[i].name = get_string("Enter player " + string(i + 1) + "'s name:", "");
	} until (players[i].name != "");
}


// Setup the discard stack
discardSize  = 0;
discardStack = array_create(stackSize - (playerCount * 10));


// Setup the stack and discard pile buttons
stackSelected   = false;
discardSelected = false;

var stackX   = (room_width / 2) - 100;
var discardX = (room_width / 2) + 20;
instance_create_depth(stackX, 80, 0, o_stack);
instance_create_depth(discardX, 80, 0, o_discard);


// Setup the players deck
var xoffset = 20;
for (i = 0; i < cardCount; i++) {
	cards[i] = instance_create_depth((i * 80) + xoffset, room_height - 200, 0, o_card);
	xoffset += 20;
	cards[i].index = i;
}


// Place the next turn button
instance_create_depth(0, 0, 0, o_nextTurn);
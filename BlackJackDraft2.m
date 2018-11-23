%BlackJack
clc;
fprintf('\n***********************\n')
fprintf('\n*       WELCOME       *\n')
fprintf('\n*          To         *\n')
fprintf('\n*       BlackJack     *\n') 
fprintf('\n***********************\n')

fprintf('\n Here are two options for you to select\n')
fprintf('\n Enter corresponding number \n')
fprintf('\n (1) Start the Game\n')
fprintf('\n (2) Check the Rules\n')
player_input = input('Please enter the nubmer at here: ');
clc;
% Enter number 1, run the game
if player_input == 1

%Open CardDeck
fprintf('\n Let us start it ~\n')
open('CardDeck_new.mat');
%Load CardDeck
load('CardDeck_new.mat')

%ShuffledDeck
ShuffledDeck = randperm(52);
a = randi(49);
A = ShuffledDeck(a);
b = a+1;
B = ShuffledDeck(b);
c = b+1;
C = ShuffledDeck(c);
d = c+1;
D = ShuffledDeck(d);
%Assign cards
Player_hand1 = ShuffledDeck(a:b);
Dealer_hand1 = ShuffledDeck(c);
Dealer_downcard = ShuffledDeck(d);
Dealer_twocard = ShuffledDeck(c:d);
%Show the figures
figure(1)
subplot(3,1,2);imshow([BlueDeck{Player_hand1}]),title('Player first base');

%figure(2)
subplot(3,1,1);imshow([BlueDeck{Dealer_hand1}]),title('Dealer upcard');

%Assgin value for Card Ace
if ShuffledDeck(A) + ShuffledDeck(B)>=11
   
   BlueDeck{1} = 1;
   BlueDeck{2} = 1;
   BlueDeck{3} = 1;
   BlueDeck{4} = 1;
else 
   BlueDeck{1} = 11;
   BlueDeck{2} = 11;
   BlueDeck{3} = 11;
   BlueDeck{4} = 11;
end
%Assign value for Card 2
BlueDeck{5} = 2;
BlueDeck{6} = 2;
BlueDeck{7} = 2;
BlueDeck{8} = 2;

%Assign value for Card 3
BlueDeck{9} = 3;
BlueDeck{10} = 3;
BlueDeck{11} = 3;
BlueDeck{12} = 3;

%Assign value for Card 4
BlueDeck{13} = 4;
BlueDeck{14} = 4;
BlueDeck{15} = 4;
BlueDeck{16} = 4;

%Assign value for Card 5
BlueDeck{17} = 5;
BlueDeck{18} = 5;
BlueDeck{19} = 5;
BlueDeck{20} = 5;

%Assign value for Card 6
BlueDeck{21} = 6;
BlueDeck{22} = 6;
BlueDeck{23} = 6;
BlueDeck{24} = 6;

%Assign value for Card 7
BlueDeck{25} = 7;
BlueDeck{26} = 7;
BlueDeck{27} = 7;
BlueDeck{28} = 7;

%Assign value for Card 8
BlueDeck{29} = 8;
BlueDeck{30} = 8;
BlueDeck{31} = 8;
BlueDeck{32} = 8;

%Assign value for Card 9
BlueDeck{33} = 9;
BlueDeck{34} = 9;
BlueDeck{35} = 9;
BlueDeck{36} = 9;

%Assign value for Card 10
BlueDeck{37} = 10;
BlueDeck{38} = 10;
BlueDeck{39} = 10;
BlueDeck{40} = 10;

%Assign value for Card Jake
BlueDeck{41} = 10;
BlueDeck{42} = 10;
BlueDeck{43} = 10;
BlueDeck{44} = 10;

%Assign value for Card Queen
BlueDeck{45} = 10;
BlueDeck{46} = 10;
BlueDeck{47} = 10;
BlueDeck{48} = 10;

%Assign value for Card King
BlueDeck{49} = 10;
BlueDeck{50} = 10;
BlueDeck{51} = 10;
BlueDeck{52} = 10;

%Display the card number sum

Dealer_One_Card = BlueDeck{C};
Player_Two_Card_Sum = BlueDeck{A}+BlueDeck{B};
fprintf('\n The Dealer card is %i',Dealer_One_Card)
fprintf('\n The sum of your two cards is %i',Player_Two_Card_Sum)

%Ask player whether he or she wants to get another card
while Player_Two_Card_Sum < 21
 %Ask Player if he or she wants another hit   
 fprintf('\n Do you want to hit another card?')
 player_2nd_input = input('Enter Yes or No here: ','s');

% The Player wants another card
if strcmpi(player_2nd_input,'Yes')
   %Open CardDeck
   open('CardDeck_new.mat');
   %Load CardDeck
   load('CardDeck_new.mat') 
   e = d+1;
   E = ShuffledDeck(e);
   Player_hit1 = ShuffledDeck(e);
   subplot(3,1,2);imshow([BlueDeck{Player_hit1}]),title('Player hit1');

if BlueDeck{A}+BlueDeck{B}+BlueDeck{D}<21
   subplot(3,1,1);imshow([BlueDeck{Dealer_twocard}]),title('Dealer downcard')
 % Compare the size of card numbers of dealer's and player's cards
   if BlueDeck{A}+BlueDeck{B}+BlueDeck{E}<BlueDeck{C}+BlueDeck{D}
       Dealer_sum = BlueDeck{c}+BlueDeck{D};
       Player_sum = BlueDeck{A}+BlueDeck{B}+BlueDeck{E};
       fprintf('\n Dealer: %i > Player: %i',Dealer_sum, Player_sum)
       fprintf('\n Unfortunately, the dealer wins')
    
   elseif BlueDeck{A}+BlueDeck{B}+BlueDeck{E}==BlueDeck{C}+BlueDeck{D}
          Dealer_sum = BlueDeck{c}+BlueDeck{D}; 
          Player_sum = BlueDeck{A}+BlueDeck{B}+BlueDeck{E};
          fprintf('\n Dealer: %i = Player: %i',Dealer_sum, Player_sum)
          fprintf('\n Tide Game, Try Again~')
   else 
        Dealer_sum = BlueDeck{c}+BlueDeck{D}; 
        Player_sum = BlueDeck{A}+BlueDeck{B}+BlueDeck{E};
        fprintf('\n Dealer: %i < Player: %i',Dealer_sum,Player_sum)
        fprintf('\n Congratulations! You win!\n')
   end
% The Player refuses another card 
elseif strcmpi(player_2nd_input,'No')
       fprintf('\n Your current card points are %i',Player_Two_Card_Sum)
  

else
    fprintf('\n Oh No, You Bust')

end
    
end

end
end

if player_input == 2
    fprintf('\n         Here are the rules for BlackJack      \n')
    fprintf('\n         1.The object of blackjack is to get as close to 21 as possible, without going over.  \n')
    fprintf('\n         2.Here is the point values for each card:  \n')
    fprintf('\n           Aces may be counted as 1 or 11 points; \n')
    fprintf('\n         2 to 9 according to pip value; \n')
    fprintf('\n           and tens and face cards count as ten points. \n')
    fprintf('\n         3.The value of a hand is the sum of the point values of the individual cards.\n')
    fprintf('\n           Except, a "blackjack" is the highest hand, consisting of an ace and any 10-point card,\n')
    fprintf('\n           and it outranks all other 21-point hands. \n')
    fprintf('\n         4.After the players have bet, the dealer will give two cards to each player and \n')
    fprintf('\n           two cards to himself.One of the dealer cards is dealt face up. \n')
    fprintf('\n           The facedown card is called the "hole card."\n')
    fprintf('\n           If the dealer does have a blackjack, then all wagers will lose\n')
    fprintf('\n           unless the player also has a blackjack, which will result in a push\n')
    fprintf('\n           If the dealer goes over 21 points, then any player who didnt already bust will win.\n')
    fprintf('\n           If the dealer does not bust, then the higher point total between the player and dealer will win. \n')
    fprintf('\n           ')
    fprintf('\n         Enter any keys to return\n')  
    pause;
    clc;
    BlackJack
end






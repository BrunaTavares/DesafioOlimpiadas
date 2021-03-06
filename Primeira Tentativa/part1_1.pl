%Todas as turistas possuem idades diferentes (20, 21, 22, 23 e 24 anos).
%A chilena pratica triathlon.
%A espanhola ficar� hospedada no bairro da Urca.
%A italiana gostaria de realizar um passeio tur�stico para conhecer o est�dio do Maracan�.
%A turista que pratica t�nis � mais de um ano mais velha do que a que possui corrida como esporte pessoal.
%A turista que gosta de praticar corrida gostaria de conhecer o P�o de A��car.
%A turista que pretende assistir V�lei de Praia nos Jogos Ol�mpicos est� hospedada em um hotel em Botafogo.
%A turista que pratica handebol deseja assistir �s competi��es de Hipismo.
%A turista de 22 anos gostaria de conhecer a praia de Ipanema.
%A argentina possui 20 anos.
%Quem ir� assistir Atletismo nos Jogos Ol�mpicos tem um ano de diferen�a em rela��o a quem est� hospedada em Ipanema.
%A turista hospedada na Barra da Tijuca tem um ano de diferen�a em rela��o � turista que pretende assistir �s competi��es de Hipismo.
%A turista que deseja assistir �s competi��es de Saltos Ornamentais deseja conhecer a Praia do Pep�.
%A belga quer assistir �s competi��es de Nata��o nos Jogos Ol�mpicos.
%A argentina tem um ano de diferen�a em rela��o � turista que gosta de jogar futebol.
%Quem deseja assistir �s competi��es de Atletismo tem um ano de diferen�a em rela��o a quem pretende conhecer a praia de Copacabana.
%Uma das turistas est� hospedada em Copacabana.


% Idade I , Nacionalidade N, Esporte E,
gera(p(I, N, E, C, A , H)) :-
        member(I, [20, 21, 22, 23, 24]),
        member(N, [chilena, espanhola, italiana, argentina, belga]),
        member(E, [triathlon, tenis, corrida, handebol, futebol]),
        member(C, [estadio, paodea�ucar, ipanema, pepe, copabana]),
        member(A, [hipismo, volei, atletismo, nata�ao, saltos]),
        member(H, [urca, botafogo, ipanema, copacabana,tijuca]).

dif(p(I1, N1, E1, C1, A1, H1), p(I2, N2, E2, C2, A2, H2)) :-
       I1 \= I2, N1 \= N2, E1 \= E2, C1 \= C2, A1 \= A2, H1 \= H2.

todas_dif(P1, P2, P3, P4,P5) :-
       dif(P1, P2), dif(P1, P3), dif(P1, P4), dif(P1,P5),
       dif(P2, P3), dif(P2, P4), dif(P2,P5),
       dif(P3, P4), dif(P3, P5),
       dif(P4,P5) .
       
gera_ef(S):-
	S = [P1, P2, P3, P4,P5],
        %P1 = p(_,chilena, _, _, _,_),
        %P2 = p(_,espanhola, _, _, _,_),
        %P3 = p(_,italiana, _, _, _,_),
        %P4 = p(_,argentina,_, _, _, _),
        %P5 = p(_,belga,_,_,_,_),
        gera(P1), gera(P2), gera(P3), gera(P4),gera(P5),
        todas_dif(P1, P2, P3, P4,P5).

solucao(S) :-
        S = [P1, P2, P3, P4,P5],
        gera_ef(P1, P2, P3, P4, P5),
        member(p( _, chilena, triathlon, _, _, _), S),
        member(p(_, espanhola, _, _, _, urca), S),
	member(p(_, italiana, _, estadio, _, _), S),
	member(p(ID1, _, tenis, _, _, _), S),
	member(p(ID2, _, corrida, paodea�ucar, _, _), S), ID2 @< ID1+1,
        member(p( _, _, _, _, volei, botafogo), S),
        member(p( _, _, handebol, _, hipismo,_),S),
        member(p(22,_,_,ipanema,_,_),S),
        member(p(20,argentina,_,_,_,_),S),
        member(p(ID3,_,_,_,atlestismo,_),S),
        member(p(ID4,_,_,_,_,ipanema),S), abs(ID3-ID4) = 1,
        member(p(ID5,_,_,_,_,tijuca),S),
        member(p(ID6,_,_,_,hipismo,_),S), abs(ID5-ID6) = 1,
        member(p(_,_,_,pepe,saltos,_),S),
        member(p(_,belga,_,_,nata�ao,_),S),
        member(p(ID7,_,futebol,_,_,_),S), abs(ID7-20) = 1,
        member(p(ID8,_,_,_,atletismo,_),S),
        member(p(ID9,_,_,copacabana,_,_),S), abs(ID9-ID8) =1.
        
        
        
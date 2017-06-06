#! @System Bialgebroid

LoadPackage( "Bialgebroid" );

#! @Example
q := RightQuiver( "q(u,v)[a:u->v,b:v->u]" );
#! q(u,v)[a:u->v,b:v->u]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
B := Algebroid( Qq, [ Qq.a * Qq.b - Qq.u, Qq.b * Qq.a - Qq.v ] );
#! Algebroid generated by the right quiver q(u,v)[a:u->v,b:v->u]
RelationsOfAlgebroid( B );
#! [ (u)-[1*(a*b) - 1*(u)]->(u), (v)-[1*(b*a) - 1*(v)]->(v) ]
counit := rec( a := 1, b := 1 );
#! rec( a := 1, b := 1 )
B2 := B^2;
#! Algebroid generated by the right quiver qxq(uu,uv,vu,vv)[\
#! ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,\
#! au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]
comult := rec( a := PreCompose(B2.au, B2.va), b := PreCompose(B2.bv, B2.ub) );
#! rec( a := (uu)-[{ 1*(ua*av) }]->(vv), b := (vv)-[{ 1*(vb*bu) }]->(uu) )
AddBialgebroidStructure( B, counit, comult );
#! Bialgebroid generated by the right quiver q(u,v)[a:u->v,b:v->u]
counit := Counit( B );
#! Functor from finitely presented Bialgebroid generated by the right quiver
#! q(u,v)[a:u->v,b:v->u] -> Algebra generated by the right quiver *(1)[]
ApplyFunctor( counit, B.u );
#! (1)
ApplyFunctor( counit, B.v );
#! (1)
ApplyFunctor( counit, IdentityMorphism( B.u ) );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, IdentityMorphism( B.v ) );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, B.a );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, B.b );
#! (1)-[1*(1)]->(1)
comult := Comultiplication( B );
#! Functor from finitely presented Bialgebroid generated by the right quiver
#! q(u,v)[a:u->v,b:v->u] -> Algebroid generated by the right quiver
#! qxq(uu,uv,vu,vv)[ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,\
#! au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]
ApplyFunctor( comult, B.u );
#! (uu)
ApplyFunctor( comult, B.v );
#! (vv)
ApplyFunctor( comult, IdentityMorphism( B.u ) );
#! (uu)-[{ 1*(uu) }]->(uu)
ApplyFunctor( comult, IdentityMorphism( B.v ) );
#! (vv)-[{ 1*(vv) }]->(vv)
ApplyFunctor( comult, B.a );
#! (uu)-[{ 1*(ua*av) }]->(vv)
ApplyFunctor( comult, B.b );
#! (vv)-[{ 1*(vb*bu) }]->(uu)
#! @EndExample

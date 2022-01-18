import React, {useState} from 'react'
import axios from 'axios'
import styled from 'styled-components'
import Card from './card'
import Hand from './hand'
import HandHistory from './handHistory'

const Wrapper = styled.div`
width: 100%;
display: flex;
flex-direction: column;
    `;

const Button = styled.div`
position:relative;
 display:inline-block;
 margin:20px;
 a{
  color:white;
  font-family:Helvetica, sans-serif;
  font-weight:bold;
  font-size:36px;
  text-align: center;
  text-decoration:none;
  background-color:#FFA12B;
  display:block;
  position:relative;
  padding:20px 40px;
  
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  text-shadow: 0px 1px 0px #000;
  filter: dropshadow(color=#000, offx=0px, offy=1px);
  
  -webkit-box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  -moz-box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
a:active{
  top:10px;
  background-color:#F78900;
  
  -webkit-box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
  -moz-box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3pxpx 0 #915100;
  box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
 }
:after{
  content:"";
  height:100%;
  width:100%;
  padding:4px;
  position: absolute;
  bottom:-15px;
  left:-4px;
  z-index:-1;
  background-color:#2B1800;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
`

const Board = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid black;
    border-radius: 15rem;
    margin-bottom: 1rem;
`
const HandsWrapper = styled.div`
min-height: 18rem;
`
const Hands = styled.div `
margin: 2rem;
`
const Winner = styled.div`
margin:1rem;
`


const Table = () => {
    const [deal, setDeal] = useState([]);

    const onClick = (e) => {
        e.preventDefault();
        axios.get('/api/deal/')
            .then((resp) => {
                setDeal(resp.data.data)
            })
    };

    return (
        <Wrapper>
            <Board>
                <Button>
                    <a href="#" onClick={onClick}>Deal</a>
                </Button>
                <HandsWrapper>
                    {deal.id &&
                    <Hands>
                        <Hand player="Player 1" cards={deal.attributes.player_1}/>
                        <Hand player="Player 2" cards={deal.attributes.player_2}/>
                        <Winner>Winner: {deal.attributes.winner}</Winner>
                    </Hands>
                    }
                </HandsWrapper>
            </Board>
            <HandHistory deal={deal}>

            </HandHistory>
        </Wrapper>
    )
};

export default Table
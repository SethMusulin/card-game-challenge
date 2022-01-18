import React, {useState} from 'react'
import styled from 'styled-components'
import Card from './card'

const HandDisplay = styled.div`
display: flex;
`
const Player = styled.span`
padding: 1rem; ;
`
const Hand = ({player, cards}) => {
    return (
        <HandDisplay>
            <Player>{player}</Player>  {cards.split(' ').map((card) => <Card card={card} key={card}/>)}
        </HandDisplay>
    )
};

export default Hand
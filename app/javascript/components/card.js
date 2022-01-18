import React from 'react'
import styled from 'styled-components'

const SingleCard = styled.div`
color: ${props => props.color };
height:5rem;
width: 3rem;
border: 1px;
border-color:${props => props.color };
border-style: solid;
display:flex;
justify-content: center;
align-items:center;
margin: 5px;
border-radius: 0.5rem;
`

const Card = ({card}) => {
    const SUITS = {"C":"♠","S": "♣","H": "♥","D": "♦"}
    const RANKS={
        "2":2,
        "3":3,
        "4":4,
        "5":5,
        "6":6,
        "7":7,
        "8":8,
        "9":9,
        "T":10,
        "J":"J",
        "Q":"Q",
        "K":"K",
        "A":"A",

    }
    return (
        <SingleCard color={["H","D"].includes(card[1])? 'red' : 'black'}>
            {RANKS[card[0]]} {SUITS[card[1]]}
        </SingleCard>

    )

}

export default Card

import React, {useState, useEffect} from 'react'
import axios from 'axios'
import styled from 'styled-components'
import Card from './card'

const Wrapper = styled.div`
    `;
const Button = styled.button`
  width: 5vw;
  height: 3vw;
`
const TableTop = styled.div`
`
const Hand = styled.div`
display: flex;
`

const Table = () => {
    const [hand, setHand] = useState([]);

    const onClick = () => {
        axios.get('/api/hands')
            .then((resp) => {
                setHand(resp.data.data)
            })
    };

    return (
        <Wrapper>
            <Button onClick={onClick}>Deal</Button>
            {hand.id &&
            <TableTop>
                <Hand>
                    Player 1: {hand.attributes.player_1.split(' ').map((card) => {
                        return (
                            <Card card={card} key={card}/>
                        )
                    })}

                </Hand>
                <Hand>
                    Player 2: {hand.attributes.player_2.split(' ').map((card) => {
                        return (
                            <Card card={card} key={card}/>
                        )
                    })}
                </Hand>
                        <div>Winner: {hand.attributes.winner}</div>
            </TableTop>
            }
        </Wrapper>
    )
};

export default Table
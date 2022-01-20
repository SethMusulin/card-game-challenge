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

const Button = styled.button`
    margin-top: 1rem;
    width: 20%;
    border-radius: 2rem;
    height: 3rem;
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
const Loader = styled.span`
min-height: 1.3rem;
`

const Table = () => {
    const [deal, setDeal] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    const onClick = (e) => {
        setIsLoading(true)
        axios.get('/api/deal/')
            .then((resp) => {
                setDeal(resp.data.data)
                setIsLoading(false)
            })
    };

    return (
        <Wrapper>
            <Board>
                <Button onClick={onClick} disabled={isLoading}>
                  <span >
                    Deal
                  </span>
                </Button>
                <Loader>
                {isLoading && <span>Loading...</span>}
                </Loader>
                <HandsWrapper>
                    {deal.id && !isLoading &&
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
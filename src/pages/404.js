import React from 'react';
import Layout from '../components/Layout';

class NotFoundPage extends React.Component {
  render() {
    return (
      <Layout location={this.props.location}>
        <main>
          <h1>Not Found</h1>
          <p>I haven’t written this post yet. Will you help me write it?</p>
          <iframe
            width="732"
            height="412"
            src="https://www.youtube.com/embed/0SeWx-FC5LE"
            frameborder="0"
            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
            allowFullscreen
          />
          <p>HARE HARE - HUM TO DIL SE HARE</p>
        </main>
      </Layout>
    );
  }
}

export default NotFoundPage;

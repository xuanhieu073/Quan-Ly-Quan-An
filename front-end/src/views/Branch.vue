<template>
  <b-container class="mt-3">
    <b-card no-body>
      <b-tabs card>
        <b-tab title="Tab 1" active>
          <b-list-group>
            <b-list-group-item>
              <b-row>
                <b-col>
                  <label for="TinyDes">TinyDes</label>
                  <b-input-group size="sm" prepend="TinyDes">
                    <b-form-input></b-form-input>
                  </b-input-group>
                </b-col>
              </b-row>
            </b-list-group-item>
            <b-list-group-item>Dapibus ac facilisis in</b-list-group-item>
          </b-list-group>
        </b-tab>
        <b-tab title="Tab 2">
          <b-card-text>Tab contents 2</b-card-text>
        </b-tab>
      </b-tabs>
    </b-card>
  </b-container>
</template>

<script>
import axios from "axios";
export default {
  components: {},
  data() {
    return {
      list: []
    };
  },
  mounted() {
    this.fetchchinhanh();
  },
  methods: {
    fetchchinhanh: function() {
      axios
        .get(`http://localhost:3000/chinhanh`)
        .then(res => {
          this.list = res.data;
          console.log(res);
        })
        .catch(err => {
          console.error(err);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
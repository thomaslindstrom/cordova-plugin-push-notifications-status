# cordova-plugin-push-notifications-status

Check whether or not push notifications are enabled.

## Methods

### `getStatus`
Returns a `String` describing the current push notifications status.

#### Return values:
- `authorized`: Enabled (explicitly).
- `denied`: Disabled (explicitly).
- `undetermined`: Disabled (you probably didn't ask).
- `unknown`

#### Example:
```javascript
const {PushNotificationsStatus} = window.cordova.plugins;

PushNotificationsStatus.getStatus(function (status) {
    if (status === 'authorized') {
        console.log('Push notifications are enabled');
    }
});
```

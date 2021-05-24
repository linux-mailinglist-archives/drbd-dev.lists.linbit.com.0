Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F838F9F7
	for <lists+drbd-dev@lfdr.de>; Tue, 25 May 2021 07:35:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B94D942094C;
	Tue, 25 May 2021 07:35:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E640420602
	for <drbd-dev@lists.linbit.com>; Mon, 24 May 2021 19:14:37 +0200 (CEST)
IronPort-SDR: VqzRGNznVQTdDi7XP+TTs4jwt14pIIEoYObln25HDnB/ty5pkHBa2r2GtddEgcePADipXEVdUI
	BmxyS7sZvF5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="181622038"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
	d="gz'50?scan'50,208,50";a="181622038"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	24 May 2021 10:14:32 -0700
IronPort-SDR: FMAsGQFTHHmzBZTY//IZcp5+lBtd/XB0L1F8iYVq+nJpIao49vs+Rp8qSkHS8nm4Y19lGHFasq
	uIgCPbNpixjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
	d="gz'50?scan'50,208,50";a="470681469"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2021 10:14:26 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1llE9p-0001IN-Tx; Mon, 24 May 2021 17:14:25 +0000
Date: Tue, 25 May 2021 01:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, axboe@kernel.dk
Message-ID: <202105250120.ClkNpWtY-lkp@intel.com>
References: <20210524145809.48169-1-lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20210524145809.48169-1-lyl2019@mail.ustc.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 May 2021 07:35:18 +0200
Cc: linux-block@vger.kernel.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2] drbd: Fix five use after free bugs in
 get_initial_state
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lv,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on block/for-next]
[also build test WARNING on linux/master linus/master v5.13-rc3 next-20210524]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lv-Yunlong/drbd-Fix-five-use-after-free-bugs-in-get_initial_state/20210524-233429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: um-allmodconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/869bb8c1a492179ef95ae5785302d1df14bd24d3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lv-Yunlong/drbd-Fix-five-use-after-free-bugs-in-get_initial_state/20210524-233429
        git checkout 869bb8c1a492179ef95ae5785302d1df14bd24d3
        # save the attached .config to linux build tree
        make W=1 ARCH=um 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/block/drbd/drbd_state.c: In function 'broadcast_state_change':
   drivers/block/drbd/drbd_state.c:1616:17: warning: cast between incompatible function types from 'int (*)(struct sk_buff *, unsigned int,  struct drbd_resource_state_change *, enum drbd_notification_type)' to 'void (*)(struct sk_buff *, unsigned int,  void *, enum drbd_notification_type)' [-Wcast-function-type]
    1616 |     last_func = (typeof(last_func))func; \
         |                 ^
   drivers/block/drbd/drbd_state.c:1629:3: note: in expansion of macro 'REMEMBER_STATE_CHANGE'
    1629 |   REMEMBER_STATE_CHANGE(notify_resource_state_change,
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1616:17: warning: cast between incompatible function types from 'int (*)(struct sk_buff *, unsigned int,  struct drbd_connection_state_change *, enum drbd_notification_type)' to 'void (*)(struct sk_buff *, unsigned int,  void *, enum drbd_notification_type)' [-Wcast-function-type]
    1616 |     last_func = (typeof(last_func))func; \
         |                 ^
   drivers/block/drbd/drbd_state.c:1638:4: note: in expansion of macro 'REMEMBER_STATE_CHANGE'
    1638 |    REMEMBER_STATE_CHANGE(notify_connection_state_change,
         |    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/block/drbd/drbd_state.c:1616:17: warning: cast between incompatible function types from 'int (*)(struct sk_buff *, unsigned int,  struct drbd_device_state_change *, enum drbd_notification_type)' to 'void (*)(struct sk_buff *, unsigned int,  void *, enum drbd_notification_type)' [-Wcast-function-type]
    1616 |     last_func = (typeof(last_func))func; \
         |                 ^
   drivers/block/drbd/drbd_state.c:1647:4: note: in expansion of macro 'REMEMBER_STATE_CHANGE'
    1647 |    REMEMBER_STATE_CHANGE(notify_device_state_change,
         |    ^~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1616:17: warning: cast between incompatible function types from 'int (*)(struct sk_buff *, unsigned int,  struct drbd_peer_device_state_change *, enum drbd_notification_type)' to 'void (*)(struct sk_buff *, unsigned int,  void *, enum drbd_notification_type)' [-Wcast-function-type]
    1616 |     last_func = (typeof(last_func))func; \
         |                 ^
   drivers/block/drbd/drbd_state.c:1661:4: note: in expansion of macro 'REMEMBER_STATE_CHANGE'
    1661 |    REMEMBER_STATE_CHANGE(notify_peer_device_state_change,
         |    ^~~~~~~~~~~~~~~~~~~~~


vim +1616 drivers/block/drbd/drbd_state.c

a29728463b254c Andreas Gruenbacher 2014-07-31  1599  
a29728463b254c Andreas Gruenbacher 2014-07-31  1600  static void broadcast_state_change(struct drbd_state_change *state_change)
a29728463b254c Andreas Gruenbacher 2014-07-31  1601  {
a29728463b254c Andreas Gruenbacher 2014-07-31  1602  	struct drbd_resource_state_change *resource_state_change = &state_change->resource[0];
a29728463b254c Andreas Gruenbacher 2014-07-31  1603  	bool resource_state_has_changed;
a29728463b254c Andreas Gruenbacher 2014-07-31  1604  	unsigned int n_device, n_connection, n_peer_device, n_peer_devices;
a29728463b254c Andreas Gruenbacher 2014-07-31  1605  	void (*last_func)(struct sk_buff *, unsigned int, void *,
a29728463b254c Andreas Gruenbacher 2014-07-31  1606  			  enum drbd_notification_type) = NULL;
805cdb8bc6da87 Kees Cook           2020-06-03  1607  	void *last_arg = NULL;
a29728463b254c Andreas Gruenbacher 2014-07-31  1608  
a29728463b254c Andreas Gruenbacher 2014-07-31  1609  #define HAS_CHANGED(state) ((state)[OLD] != (state)[NEW])
a29728463b254c Andreas Gruenbacher 2014-07-31  1610  #define FINAL_STATE_CHANGE(type) \
a29728463b254c Andreas Gruenbacher 2014-07-31  1611  	({ if (last_func) \
a29728463b254c Andreas Gruenbacher 2014-07-31  1612  		last_func(NULL, 0, last_arg, type); \
a29728463b254c Andreas Gruenbacher 2014-07-31  1613  	})
a29728463b254c Andreas Gruenbacher 2014-07-31  1614  #define REMEMBER_STATE_CHANGE(func, arg, type) \
a29728463b254c Andreas Gruenbacher 2014-07-31  1615  	({ FINAL_STATE_CHANGE(type | NOTIFY_CONTINUES); \
a29728463b254c Andreas Gruenbacher 2014-07-31 @1616  	   last_func = (typeof(last_func))func; \
a29728463b254c Andreas Gruenbacher 2014-07-31  1617  	   last_arg = arg; \
a29728463b254c Andreas Gruenbacher 2014-07-31  1618  	 })
a29728463b254c Andreas Gruenbacher 2014-07-31  1619  
a29728463b254c Andreas Gruenbacher 2014-07-31  1620  	mutex_lock(&notification_mutex);
a29728463b254c Andreas Gruenbacher 2014-07-31  1621  
a29728463b254c Andreas Gruenbacher 2014-07-31  1622  	resource_state_has_changed =
a29728463b254c Andreas Gruenbacher 2014-07-31  1623  	    HAS_CHANGED(resource_state_change->role) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1624  	    HAS_CHANGED(resource_state_change->susp) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1625  	    HAS_CHANGED(resource_state_change->susp_nod) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1626  	    HAS_CHANGED(resource_state_change->susp_fen);
a29728463b254c Andreas Gruenbacher 2014-07-31  1627  
a29728463b254c Andreas Gruenbacher 2014-07-31  1628  	if (resource_state_has_changed)
a29728463b254c Andreas Gruenbacher 2014-07-31  1629  		REMEMBER_STATE_CHANGE(notify_resource_state_change,
a29728463b254c Andreas Gruenbacher 2014-07-31  1630  				      resource_state_change, NOTIFY_CHANGE);
a29728463b254c Andreas Gruenbacher 2014-07-31  1631  
a29728463b254c Andreas Gruenbacher 2014-07-31  1632  	for (n_connection = 0; n_connection < state_change->n_connections; n_connection++) {
a29728463b254c Andreas Gruenbacher 2014-07-31  1633  		struct drbd_connection_state_change *connection_state_change =
a29728463b254c Andreas Gruenbacher 2014-07-31  1634  				&state_change->connections[n_connection];
a29728463b254c Andreas Gruenbacher 2014-07-31  1635  
a29728463b254c Andreas Gruenbacher 2014-07-31  1636  		if (HAS_CHANGED(connection_state_change->peer_role) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1637  		    HAS_CHANGED(connection_state_change->cstate))
a29728463b254c Andreas Gruenbacher 2014-07-31  1638  			REMEMBER_STATE_CHANGE(notify_connection_state_change,
a29728463b254c Andreas Gruenbacher 2014-07-31  1639  					      connection_state_change, NOTIFY_CHANGE);
a29728463b254c Andreas Gruenbacher 2014-07-31  1640  	}
a29728463b254c Andreas Gruenbacher 2014-07-31  1641  
a29728463b254c Andreas Gruenbacher 2014-07-31  1642  	for (n_device = 0; n_device < state_change->n_devices; n_device++) {
a29728463b254c Andreas Gruenbacher 2014-07-31  1643  		struct drbd_device_state_change *device_state_change =
a29728463b254c Andreas Gruenbacher 2014-07-31  1644  			&state_change->devices[n_device];
a29728463b254c Andreas Gruenbacher 2014-07-31  1645  
a29728463b254c Andreas Gruenbacher 2014-07-31  1646  		if (HAS_CHANGED(device_state_change->disk_state))
a29728463b254c Andreas Gruenbacher 2014-07-31  1647  			REMEMBER_STATE_CHANGE(notify_device_state_change,
a29728463b254c Andreas Gruenbacher 2014-07-31  1648  					      device_state_change, NOTIFY_CHANGE);
a29728463b254c Andreas Gruenbacher 2014-07-31  1649  	}
a29728463b254c Andreas Gruenbacher 2014-07-31  1650  
a29728463b254c Andreas Gruenbacher 2014-07-31  1651  	n_peer_devices = state_change->n_devices * state_change->n_connections;
a29728463b254c Andreas Gruenbacher 2014-07-31  1652  	for (n_peer_device = 0; n_peer_device < n_peer_devices; n_peer_device++) {
a29728463b254c Andreas Gruenbacher 2014-07-31  1653  		struct drbd_peer_device_state_change *p =
a29728463b254c Andreas Gruenbacher 2014-07-31  1654  			&state_change->peer_devices[n_peer_device];
a29728463b254c Andreas Gruenbacher 2014-07-31  1655  
a29728463b254c Andreas Gruenbacher 2014-07-31  1656  		if (HAS_CHANGED(p->disk_state) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1657  		    HAS_CHANGED(p->repl_state) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1658  		    HAS_CHANGED(p->resync_susp_user) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1659  		    HAS_CHANGED(p->resync_susp_peer) ||
a29728463b254c Andreas Gruenbacher 2014-07-31  1660  		    HAS_CHANGED(p->resync_susp_dependency))
a29728463b254c Andreas Gruenbacher 2014-07-31  1661  			REMEMBER_STATE_CHANGE(notify_peer_device_state_change,
a29728463b254c Andreas Gruenbacher 2014-07-31  1662  					      p, NOTIFY_CHANGE);
a29728463b254c Andreas Gruenbacher 2014-07-31  1663  	}
a29728463b254c Andreas Gruenbacher 2014-07-31  1664  
a29728463b254c Andreas Gruenbacher 2014-07-31  1665  	FINAL_STATE_CHANGE(NOTIFY_CHANGE);
a29728463b254c Andreas Gruenbacher 2014-07-31  1666  	mutex_unlock(&notification_mutex);
a29728463b254c Andreas Gruenbacher 2014-07-31  1667  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--qMm9M+Fa2AknHoGS
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
egEA

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--qMm9M+Fa2AknHoGS--

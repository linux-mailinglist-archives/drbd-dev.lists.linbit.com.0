Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFzpEMrjx2mueQUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 15:20:58 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id BFF4F34EA77
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 15:20:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4AB21630D6;
	Sat, 28 Mar 2026 15:20:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A30CB160867
	for <drbd-dev@lists.linbit.com>; Sat, 28 Mar 2026 15:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1774707637; x=1806243637;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:content-transfer-encoding:in-reply-to;
	bh=xr7fm3XNdKFxhFsYnaPlMjk6niRTPElL9UdF0ILudQA=;
	b=Hyg8qqroRT1BRbOm4avFB2Rq8UY2KyejEWZp9BQj/ClVJDk3qJH/GvCy
	i2qs+UyZtd9h9AU/ihdWuFgCBx9ThRi78F+KPKe6Cx8cs2PtZ7NOhyBIp
	Dbs6R6z2hk8i6qN05EvhNAm6WWYzoZTvnoudfBBzsXbUD0mZydcNGqQbA
	pbbmKm0g1/MthLi5AXAAnW7fJOfbRlOUqikXyavvVz69xIOHN0xhK5xjg
	3MW50LdgLGXsWYppswDFjQLZKu8TAyl2qM0WseoB8BivU0MySPKvxZwnE
	B+BgQzUe0t/4KlDMJx8N37+VYpSIrZpGKuCCoS3uN9CCgYloo1Lh+kjVR w==;
X-CSE-ConnectionGUID: v7l9/+IYT2WsECeGOt85xw==
X-CSE-MsgGUID: 1Cs3oBhBQqK9AkzhZwOJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79623477"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="79623477"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
	by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Mar 2026 07:20:36 -0700
X-CSE-ConnectionGUID: 3xBoiMHYT3W+qHOk6uAp3A==
X-CSE-MsgGUID: muGkjwO0Qf+P8icEx5iqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="225833073"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
	by orviesa007.jf.intel.com with ESMTP; 28 Mar 2026 07:20:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>) id 1w6UWe-00000000BU3-1W1P;
	Sat, 28 Mar 2026 14:20:32 +0000
Date: Sat, 28 Mar 2026 22:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/20] drbd: remove BROKEN for DRBD
Message-ID: <202603282234.zZBLE37a-lkp@intel.com>
References: <20260327223820.2244227-21-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327223820.2244227-21-christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:llvm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BFF4F34EA77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-21-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 20/20] drbd: remove BROKEN for DRBD
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603282234.zZBLE37a-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282234.zZBLE37a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282234.zZBLE37a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_transport_rdma.c:618:11: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     618 |         int err, i = 0;
         |                  ^
   1 warning generated.


vim +/i +618 drivers/block/drbd/drbd_transport_rdma.c

bc43430bc671a7 Christoph Böhmwalder 2026-03-27  610  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  611  
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  612  static int dtr_recv_bio(struct drbd_transport *transport, struct bio_list *bios, size_t size)
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  613  {
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  614  	struct dtr_transport *rdma_transport =
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  615  		container_of(transport, struct dtr_transport, transport);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  616  	struct dtr_stream *rdma_stream = &rdma_transport->stream[DATA_STREAM];
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  617  	struct page *page;
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27 @618  	int err, i = 0;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  619  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  620  	if (!dtr_transport_ok(transport))
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  621  		return -ECONNRESET;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  622  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  623  	// pr_info("%s: in recv_pages, size: %zu\n", rdma_stream->name, size);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  624  	TR_ASSERT(transport, rdma_stream->current_rx.bytes_left == 0);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  625  	dtr_recycle_rx_desc(transport, DATA_STREAM, &rdma_stream->current_rx.desc, GFP_NOIO);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  626  	dtr_refill_rx_desc(rdma_transport, DATA_STREAM);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  627  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  628  	while (size) {
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  629  		struct dtr_rx_desc *rx_desc = NULL;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  630  		long t;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  631  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  632  		t = wait_event_interruptible_timeout(rdma_stream->recv_wq,
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  633  					dtr_receive_rx_desc(rdma_transport, DATA_STREAM, &rx_desc),
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  634  					rdma_stream->recv_timeout);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  635  
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  636  		if (t <= 0)
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  637  			return t == 0 ? -EAGAIN : -EINTR;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  638  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  639  		page = rx_desc->page;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  640  		/* put_page() if we would get_page() in
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  641  		 * dtr_create_rx_desc().  but we don't. We return the page
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  642  		 * chain to the user, which is supposed to give it back to
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  643  		 * drbd_free_pages() eventually. */
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  644  		rx_desc->page = NULL;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  645  		size -= rx_desc->size;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  646  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  647  		/* If the sender did dtr_send_page every bvec of a bio with
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  648  		 * unaligned bvecs (as xfs often creates), rx_desc->size and
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  649  		 * offset may well be not the PAGE_SIZE and 0 we hope for.
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  650  		 */
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  651  
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  652  		err = drbd_bio_add_page(transport, bios, page, rx_desc->size, 0);
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  653  		if (err < 0)
221cfdc61a60c9 Christoph Böhmwalder 2026-03-27  654  			return err;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  655  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  656  		atomic_dec(&rx_desc->cm->path->flow[DATA_STREAM].rx_descs_allocated);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  657  		dtr_free_rx_desc(rx_desc);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  658  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  659  		i++;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  660  		dtr_refill_rx_desc(rdma_transport, DATA_STREAM);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  661  	}
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  662  
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  663  	// pr_info("%s: rcvd %d pages\n", rdma_stream->name, i);
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  664  	return 0;
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  665  }
bc43430bc671a7 Christoph Böhmwalder 2026-03-27  666  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

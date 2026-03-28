Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2V5JC8fJx2nJcQUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 13:29:59 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id B143B34E685
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 13:29:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 629051627B2;
	Sat, 28 Mar 2026 13:29:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 429 seconds by postgrey-1.31 at mail19;
	Sat, 28 Mar 2026 13:29:42 CET
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 568D9160867
	for <drbd-dev@lists.linbit.com>; Sat, 28 Mar 2026 13:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1774700982; x=1806236982;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=01Mfx2yhrdKt7kNgZD6z/YZFVAtYMbYQCfPVplKHSds=;
	b=SDHlf7ehZr9P6b7JkMgPOreVbrx7mjD3yDUvBLPleMAEXswojU+K/5fG
	2bOgBPxgc0r90hEzpUM64SQmTNGl/wA8PcUA959TGz0oBvX/TWYK8CAcc
	4VHe0I6Rc3ik1k6PReOmfLHFJl12oXHtoUA7uUrQTUA5xBuEa3fRGlAB0
	5+HCDwJcxHyyq5ykyCPBUHGug4zWUSxUgT6scRdipwHWths2ViJWA2Ifd
	m0dnkGVD9wmn3SNHpeW8rmUh65YhH2saE7dlSSvHTPkQwJ5hXrImOA+0P
	kSVtpLLIXPr2Ptch32/ymKiAiqJLDjNKdN6/KLZ/U8EkBKCgmDg2m+L+w g==;
X-CSE-ConnectionGUID: 11ZwMhzPRYCdK5kR2z3pcQ==
X-CSE-MsgGUID: x2IPWMdSRM+ToCCZQ9FhVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86834372"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="86834372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
	by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Mar 2026 05:22:31 -0700
X-CSE-ConnectionGUID: 6B6jVEZkT86z4g1TmEz80A==
X-CSE-MsgGUID: D8lZGgLmTb+DeV7JCHHGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="225817333"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
	by orviesa007.jf.intel.com with ESMTP; 28 Mar 2026 05:22:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>) id 1w6SgM-00000000BOv-0Rrq;
	Sat, 28 Mar 2026 12:22:26 +0000
Date: Sat, 28 Mar 2026 20:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/20] drbd: remove BROKEN for DRBD
Message-ID: <202603282006.UELjhGio-lkp@intel.com>
References: <20260327223820.2244227-21-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327223820.2244227-21-christoph.boehmwalder@linbit.com>
Cc: linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: B143B34E685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-21-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 20/20] drbd: remove BROKEN for DRBD
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260328/202603282006.UELjhGio-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282006.UELjhGio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282006.UELjhGio-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/block/drbd/drbd_receiver.c:496 function parameter 'peer_device' not described in 'drbd_alloc_peer_req'
>> Warning: drivers/block/drbd/drbd_receiver.c:496 function parameter 'peer_device' not described in 'drbd_alloc_peer_req'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

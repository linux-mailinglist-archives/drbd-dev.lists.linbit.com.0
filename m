Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFEYC8zDumkNbwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:25:00 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id C1AE22BE22C
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:24:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA69B160904;
	Wed, 18 Mar 2026 16:24:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 947F6160904
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 16:24:42 +0100 (CET)
Received: by mail-wm1-f53.google.com with SMTP id
	5b1f17b1804b1-48541edecf9so76300225e9.1
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773847481;
	x=1774452281; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=Gyu5ICoUlpKJMIvNRjsizKDezce3zOQx/9IXKSYvK4Y=;
	b=ckRrWFEPXC9LF6Iny7CBNCNYXmzkRUEgx1Fty6GoUSj303kR4z9Onu2LqCCmMN9/FB
	Vkbx69NmOxRXu8iQ5NmWQeHh7UQmmqhOC9SOR5Z1r+snqSYd7+jmlyT3yTf0JzJBAoxV
	BOHr7LnL9GHalG4/2EBqKfgTH5XzB+SOeSWG46Dp20TyE9NR1pDtbojUoXVM1fbCWuzP
	0xa9NrBTMAcpbWIHkoYxdDhXgDH1qT/aCJo2si+bPzsX/0htJilIIQGrq6B5G7bxT+GV
	oYOoFqHCEIgSsn2VFRby9u92xBSyU+2L+AJsCaCCkPesrT0oa3x+gCU+Aats9HCHVaYt
	fSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773847481; x=1774452281;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=Gyu5ICoUlpKJMIvNRjsizKDezce3zOQx/9IXKSYvK4Y=;
	b=BJTZk1cKqR+iVNC6hX3oXQL8tzEVMo8QTN3H5gdA55o8IZOW7waoCt8d8utsEdtUdJ
	i/1RW9hOdiaMI/ljWIhXlwcnY3+iFEsLcDA6dY4Xe2SHedauehOBtfCaOqLEhKxnDLuu
	P8tMMUH1XP6XBly1+sRTpIrjMSLDlmI7OASZJTb271tiCCh6uGiDk5+90NdHt+EJqihk
	4NJchNrAw6n8F/OiBt/xZgBTaPyHu0+JLQFzB7FT+rX88xlSrYm/+3QaNqbGmiQIoxRJ
	IRzCSMgmKEejNs5HwEHsAQhwngftoekbJ/VV12GV/WfVw1k0H42ME5aCCnJGfy4sWFqY
	9LIw==
X-Forwarded-Encrypted: i=1;
	AJvYcCV8pHeCF+BOaFYJBWR89FV4YIjuKbvjsHn1mbkWxSfPjPbX4ZzcCP0j2Mtn3nmOZhMhSJFuGSes2w==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw7rerzJnQ+rSSSc7O4xo3P2Ghm1V38Avye9xH/IbgLSx6H3EZH
	6MQWlJvJLgodVsGQOijZLH70tzkMv6z3AOAPKGqYpgu5DmX/jbHTsVGKXath+8akIXjKMQ==
X-Gm-Gg: ATEYQzwiQezyad/VD+UJe2fhpIfOqHaLwHvDIWDeIJ+/T6mEKk9YVHjLDVDZAJYUPZg
	13Ko2FpCwiQqPqfYyAQ/AiuK17ZO9KzohYdJiCi+NTsAOWaX3uVQgKoTVZZ23Bm5PRpFx6JkdOz
	h5f2osdmGvOre/5XNC0AgRgRMBHFrEjn7akSGGz4D52ItodEqxty+sDeTg+gkO9t+WDx+tqsCUn
	i3fbJSSkpjTv2ANjfDXBuNloF8IwRVz2EQMJkc1o3Z/qfAowtzXKiWjVJOmCkjI1mg9rIYxnK39
	kW+3Kbnt6rtrcMBBODsVm4FYNZ0xk1BhLQqQQR77kdEop1ESywkymfNRYndCbdRGGvmth3tzsUP
	2ifzXNlUMm/r2K8G21TDLZKhp+rsnwa5BDY+3t0h4S5iqYIq7E7vZFXaYv2WpTBVtxnZXEpFPnv
	RqEan/mQL+kJpB1ESVMa0XUTSIJlNCpWmnx8FMG3XWA6Lv8GKonh5kn81H54k6CA+FtOiQ7ln/T
	aa5uzUmwUqiC8s=
X-Received: by 2002:a05:600c:3b28:b0:485:3aa1:a7f1 with SMTP id
	5b1f17b1804b1-486f441bc51mr65620445e9.7.1773847481385; 
	Wed, 18 Mar 2026 08:24:41 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-4856eae3396sm144310575e9.9.2026.03.18.08.24.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 08:24:40 -0700 (PDT)
Message-ID: <eeb73048-d5ae-4fbd-9920-1395a3ca51eb@linbit.com>
Date: Wed, 18 Mar 2026 16:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drbd: fix rdma dependency
To: Arnd Bergmann <arnd@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <20260318104858.1868731-1-arnd@kernel.org>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <20260318104858.1868731-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:arnd@arndb.de,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:ardb@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.642];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C1AE22BE22C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Am 18.03.26 um 11:48 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new rdma transport module uses a trick to only build support
> if infiniband/rdma is enabled. This seems to be done the wrong way
> around, as it gets built if RDMA is in a loadable module, but not
> if it's built-in.
> 
> However, this fails in configurations that have infiniband support
> in a loadable module but drbd built-in:
> 
> ERROR: modpost: "rdma_bind_addr" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_listen" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_destroy_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_destroy_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_disconnect" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "__rdma_create_kernel_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_resolve_route" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_reject" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_accept" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> ERROR: modpost: "rdma_create_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
> 
> Address this by moving the logic from Makefile into Kconfig and
> describing the two conditions in which rdma transport can be used
> in drbd.
> 
> Fixes: 038cb6e644e4 ("drbd: add RDMA transport implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/block/drbd/Kconfig  | 5 +++++
>  drivers/block/drbd/Makefile | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
> index 377f0d040031..29ec6ed84251 100644
> --- a/drivers/block/drbd/Kconfig
> +++ b/drivers/block/drbd/Kconfig
> @@ -39,6 +39,11 @@ config BLK_DEV_DRBD
>  
>  	  If unsure, say N.
>  
> +config DRBD_TRANSPORT_RDMA
> +	tristate
> +	depends on RDMA=y || (BLK_DEV_DRBD=RDMA)
> +	default BLK_DEV_DRBD
> +
>  config DRBD_FAULT_INJECTION
>  	bool "DRBD fault injection"
>  	depends on BLK_DEV_DRBD
> diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
> index 99a1cfeed423..caf888235d53 100644
> --- a/drivers/block/drbd/Makefile
> +++ b/drivers/block/drbd/Makefile
> @@ -13,4 +13,4 @@ obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
>  
>  obj-$(CONFIG_BLK_DEV_DRBD)     += drbd_transport_tcp.o
>  obj-$(CONFIG_BLK_DEV_DRBD)     += drbd_transport_lb-tcp.o
> -obj-$(if $(CONFIG_BLK_DEV_DRBD),$(if $(CONFIG_INFINIBAND),m)) += drbd_transport_rdma.o
> +obj-$(CONFIG_DRBD_TRANSPORT_RDMA) += drbd_transport_rdma.o

Seems like we raced here, I already (supposedly?) fixed this on the
drbd-next branch.

My fix is this Kconfig:

config BLK_DEV_DRBD_RDMA
	tristate "DRBD RDMA transport"
	depends on BLK_DEV_DRBD && INFINIBAND_ADDR_TRANS
	help

	  RDMA transport support for DRBD. This enables DRBD replication
	  over RDMA-capable networks for lower latency and higher throughput.

	  If unsure, say N.

And then just this in the Makefile:

obj-$(CONFIG_BLK_DEV_DRBD_RDMA) += drbd_transport_rdma.o

That should be equivalent, right?

Thanks,
Christoph

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage


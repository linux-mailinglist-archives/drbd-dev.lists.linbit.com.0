Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70323B13163
	for <lists+drbd-dev@lfdr.de>; Sun, 27 Jul 2025 21:01:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3CDB1622A7;
	Sun, 27 Jul 2025 21:00:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 142B1160645
	for <drbd-dev@lists.linbit.com>; Sun, 27 Jul 2025 21:00:49 +0200 (CEST)
Received: by mail-wr1-f54.google.com with SMTP id
	ffacd0b85a97d-3b78294a233so706260f8f.3
	for <drbd-dev@lists.linbit.com>; Sun, 27 Jul 2025 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1753642849; x=1754247649;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:subject:user-agent:mime-version:date:message-id:from
	:to:cc:subject:date:message-id:reply-to;
	bh=pQ8eZFEj7X1YQOuUROSpfYO1/lMHcm0JAgIfCTXQCIg=;
	b=jAcMTmKkDEBVJBnrGk3QTR7x7qcjaqyJcV+v+0jCbTgzFR7zSjactqRZ2gse6zxZ2z
	9M0vhVjXY7vUHwCfIxd4zCzA/kVDMbfi9iSMIrkAoPCnCzmTf1/1SEMafhjsKp+OBsd4
	SPjDxcMeM+4THOVKOztILys0fyCOzGLnuj7V2DMhxZd+DV5oY0ByAmwyZQm2FALpUj8c
	cL//FnIxPuSum82/gGSYdcEJuql9Y/bKeku9GoAp8B7HTAJT4PPCY8aGYREoQzUNEe44
	ri2412fnFWYDa577cD1NwpaBi6MwtrFJaQkZGuxGi5RL5HEokaQVgptf3NgZ0w658bdt
	AFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1753642849; x=1754247649;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=pQ8eZFEj7X1YQOuUROSpfYO1/lMHcm0JAgIfCTXQCIg=;
	b=W/vMrNizYeb2kY0/t8vp/d9YMbuxUutnRvWSC06EGyrbHvlXDJVBuRkSbMj++aSstm
	sp8UyofFPzF547sdH7a9JtvCWuNeriRY2ODYi1ZhtfCmFqWjL+aJfdKKmeLcrlpH7rvh
	mv1rSOrz5cITdc+ou8560w1D6T1+t6hID6TkiGL6C5WcA53jtNwiwtSQagURRhBeO27v
	hQpXs4/r0b+lKbThEn4eD4Oa9C5SDv6R8S8ipRhURiSj10j9t4s0N6lsUhG/2bDLSHs6
	HJ22g3vDer1n2iXMn4n06A98yKl4Gu7RA0gwe4fG0IVDLpfixkQt7R2As7mf+tpTZZON
	D9cw==
X-Forwarded-Encrypted: i=1;
	AJvYcCUzuGaGFc2uGQd3SVVTxPCLwnGYWOW8Tbys167ZvORn+P+dWBwSJzWlbLgBydyrGYsmgakvCdzbIw==@lists.linbit.com
X-Gm-Message-State: AOJu0YwEW8nTgeZcA6CLstipY7VRoFNcyl5qCKEEAR9VosG4IooZvSdl
	ZoCsYuTuvwqAnTmsNOvxCE2WRFm+v/WPMjpSjVrW+kobRJ/0h2nap53n
X-Gm-Gg: ASbGncs093ssx0AeXVPae0ZlW/xKUh17WZBGVhxci9P9XwukkNpLNzIXqb66CklyNy+
	O9ZHauE5Lbd7Lhoo+PzZFjtpkl6bgIOMTmGe+cJhmL63MzD7K0Q98iHzDPoqCwt6Mgk2BRfh6he
	atdHU3p7+hEyjNIPfFWvp0rAHJG2xY59tG7VgB2iEs+Obop8fRn90JoDNYXbhWRMKIPEIGCIoLb
	+xDk34LpSgsKMJVG+ALEYGDYDPXiQ4Pp1lnb9jFm+09Hc6xNzhkB0yS1SZdY0F6o5c/Wco1CmlM
	nl74OTN/5Bri/FKrTeWdKEMf8iYuzOJWTgnDhqmzc8Q0xR54P65AW2uiLxKHWHff59wW7iISx/Y
	LtuQY5j4auexPwfFKDBaC2p5+S9JfpYMR
X-Google-Smtp-Source: AGHT+IHzKrz8ba+Kxaj5dRaIxXmCTwpCXqZajNY+RL3fN+yysFED5tpP5DZWeE6HT1v9R153ZvvQLw==
X-Received: by 2002:a05:600c:4590:b0:43c:f8fe:dd82 with SMTP id
	5b1f17b1804b1-4587643ec92mr78758265e9.18.1753642849143; 
	Sun, 27 Jul 2025 12:00:49 -0700 (PDT)
Received: from [192.168.1.3] ([102.46.170.88])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-3b778f045f3sm6369939f8f.46.2025.07.27.12.00.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 27 Jul 2025 12:00:48 -0700 (PDT)
Message-ID: <6e1b72fa-900b-45b8-8b89-37cd84cad779@gmail.com>
Date: Sun, 27 Jul 2025 22:00:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] DRBD: replace strcpy with strscpy
References: <20250704175018.333165-1-eslam.medhat1993@gmail.com>
	<20250705173248.59003-1-eslam.medhat1993@gmail.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <20250705173248.59003-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>, skhan@linuxfoundation.com,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
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

Hi,

kind reminder about this patch change.
I appreciate your time reviewing this.

Regards,
Eslam Khafagy



On 7/5/25 20:32, Eslam Khafagy wrote:
> strcpy is deprecated due to lack of bounds checking. This patch replaces
> strcpy with strscpy, the recommended alternative for null terminated
> strings, to follow best practices.
>
> I had to do a small refactor for __drbd_send_protocol since it uses
> strlen anyways. so why not use that for strscpy.
>
> V2:
>   - I forgot about null termination so i fixed it.
>
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
>   drivers/block/drbd/drbd_main.c     | 17 +++++++++--------
>   drivers/block/drbd/drbd_receiver.c |  4 ++--
>   2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 52724b79be30..028a5cf41d7f 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -742,9 +742,9 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
>   	}
>   
>   	if (apv >= 88)
> -		strcpy(p->verify_alg, nc->verify_alg);
> +		strscpy(p->verify_alg, nc->verify_alg);
>   	if (apv >= 89)
> -		strcpy(p->csums_alg, nc->csums_alg);
> +		strscpy(p->csums_alg, nc->csums_alg);
>   	rcu_read_unlock();
>   
>   	return drbd_send_command(peer_device, sock, cmd, size, NULL, 0);
> @@ -771,10 +771,6 @@ int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cm
>   		return -EOPNOTSUPP;
>   	}
>   
> -	size = sizeof(*p);
> -	if (connection->agreed_pro_version >= 87)
> -		size += strlen(nc->integrity_alg) + 1;
> -
>   	p->protocol      = cpu_to_be32(nc->wire_protocol);
>   	p->after_sb_0p   = cpu_to_be32(nc->after_sb_0p);
>   	p->after_sb_1p   = cpu_to_be32(nc->after_sb_1p);
> @@ -787,8 +783,13 @@ int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cm
>   		cf |= CF_DRY_RUN;
>   	p->conn_flags    = cpu_to_be32(cf);
>   
> -	if (connection->agreed_pro_version >= 87)
> -		strcpy(p->integrity_alg, nc->integrity_alg);
> +	size = sizeof(*p);
> +	if (connection->agreed_pro_version >= 87) {
> +		int integrity_len = strlen(nc->integrity_alg) + 1;
> +		size += integrity_len;
> +		strscpy(p->integrity_alg, nc->integrity_alg, integrity_len);
> +	}
> +
>   	rcu_read_unlock();
>   
>   	return __conn_send_command(connection, sock, cmd, size, NULL, 0);
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index e5a2e5f7887b..9c2d439f26e8 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3985,14 +3985,14 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>   			*new_net_conf = *old_net_conf;
>   
>   			if (verify_tfm) {
> -				strcpy(new_net_conf->verify_alg, p->verify_alg);
> +				strscpy(new_net_conf->verify_alg, p->verify_alg);
>   				new_net_conf->verify_alg_len = strlen(p->verify_alg) + 1;
>   				crypto_free_shash(peer_device->connection->verify_tfm);
>   				peer_device->connection->verify_tfm = verify_tfm;
>   				drbd_info(device, "using verify-alg: \"%s\"\n", p->verify_alg);
>   			}
>   			if (csums_tfm) {
> -				strcpy(new_net_conf->csums_alg, p->csums_alg);
> +				strscpy(new_net_conf->csums_alg, p->csums_alg);
>   				new_net_conf->csums_alg_len = strlen(p->csums_alg) + 1;
>   				crypto_free_shash(peer_device->connection->csums_tfm);
>   				peer_device->connection->csums_tfm = csums_tfm;
